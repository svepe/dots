from argparse import ArgumentParser
from math import fabs
from re import search
from subprocess import check_output

# Recommended keyboard shortcuts
#
# Focus Win 1 [<Alt>1]: python3 <path>/switch.py --focus 0
# Focus Win 2 [<Alt>2]: python3 <path>/switch.py --focus 1
# Focus Win 3 [<Alt>3]: python3 <path>/switch.py --focus 2
# Focus Win 4 [<Alt>4]: python3 <path>/switch.py --focus 3
# Focus Win 5 [<Alt>5]: python3 <path>/switch.py --focus 4
# Focus Win 6 [<Alt>6]: python3 <path>/switch.py --focus 5
#
# Focus Right Win 1 [<Alt>7]: python3 <path>/switch.py --focus 0 --right-display
# Focus Right Win 2 [<Alt>8]: python3 <path>/switch.py --focus 1 --right-display
# Focus Right Win 3 [<Alt>9]: python3 <path>/switch.py --focus 2 --right-display
# Focus Right Win 4 [<Alt>0]: python3 <path>/switch.py --focus 3 --right-display
#
# Focus Win Left [<Alt>h]: python3 <path>/spatial-focus/switch.py --move left
# Focus Win Right [<Alt>l]: python3 <path>/spatial-focus/switch.py --move right
# Focus Win Above [<Alt>k]: python3 <path>/spatial-focus/switch.py --move above
# Focus Win Below [<Alt>j]: python3 <path>/spatial-focus/switch.py --move below

class xdotool:
    @staticmethod
    def get_desktop():
        res = check_output(["xdotool", "get_desktop"])
        return int(res)

    @staticmethod
    def get_visible_windows(did=None):
        if did is None:
            did = str(xdotool.get_desktop())

        res = check_output([
            "xdotool", "search", "--onlyvisible", "--desktop", did, ".*"])

        return [int(wid) for wid in res.decode('utf-8').rstrip().split('\n')]

    @staticmethod
    def get_display_geometry():
        res = check_output(["xdotool", "getdisplaygeometry"]).decode('utf-8')
        w, h = search(r'(?P<w>\d*) (?P<h>\d*)', res).group('w', 'h')
        return tuple(int(v) for v in [w, h])

    @staticmethod
    def get_window_geometry(wid):
        res = check_output(["xdotool", "getwindowgeometry", str(wid)]).decode('utf-8')
        x, y = search(r'Position: (?P<x>\d*),(?P<y>\d*)', res).group('x', 'y')
        w, h = search(r'Geometry: (?P<w>\d*)x(?P<h>\d*)', res).group('w', 'h')
        return tuple(int(v) for v in [x, y, w, h])

    @staticmethod
    def get_window_name(wid):
        res = check_output(["xdotool", "getwindowname", str(wid)])
        return res.decode('utf-8').rstrip()

    @staticmethod
    def get_active_window():
        res = check_output(["xdotool", "getactivewindow"])
        return int(res.decode('utf-8').rstrip())

    @staticmethod
    def window_activate(wid):
        print(["xdotool", "windowactivate", str(wid)])
        check_output(["xdotool", "windowactivate", str(wid)])


class Window:
    def __init__(self, wid):
        self.wid = wid
        self.x, self.y, self.w, self.h = xdotool.get_window_geometry(wid)
        self.name = xdotool.get_window_name(wid)

    @property
    def active(self):
        return self.wid == xdotool.get_active_window()

    def activate(self):
        xdotool.window_activate(self.wid)

    def __str__(self):
        return '{} {} {}: {}, {}, {}, {})'.format(
            '->' if self.active else '  ',
            self.wid,
            self.name[:16] + '... ', self.x, self.y, self.w, self.h)


parser = ArgumentParser()
parser.add_argument('--focus', default=None, type=int)
parser.add_argument('--right-display', default=False, action='store_true')
parser.add_argument('--left-display', default=False, action='store_true')
parser.add_argument('--move', default=None)
args = parser.parse_args()


def get_active_window(windows):
    return next((i, w) for i, w in enumerate(windows) if w.active)


def activate_left(win, windows):
    # Make navigation cyclic
    width, _ = xdotool.get_display_geometry()
    for w in windows:
        if w.x >= win.x:
            w.x -= 2 * width
    windows.sort(key=lambda w: (win.x - w.x, fabs(w.y - win.y), w.name))
    windows[0].activate()


def activate_right(win, windows):
    # Make navigation cyclic
    width, _ = xdotool.get_display_geometry()
    for w in windows:
        if w.x <= win.x:
            w.x += 2 * width
    windows.sort(key=lambda w: (w.x - win.x, fabs(w.y - win.y), w.name))
    windows[0].activate()


def activate_above(win, windows):
    windows = [w for w in windows if w.y < win.y]
    if not windows:
        return
    windows.sort(key=lambda w: (win.y - w.y, fabs(w.x - win.x), w.name))
    windows[0].activate()


def activate_below(win, windows):
    windows = [w for w in windows if w.y > win.y]
    if not windows:
        return
    windows.sort(key=lambda w: (w.y - win.y, fabs(w.x - win.x), w.name))
    windows[0].activate()


def main():
    windows = [Window(wid) for wid in xdotool.get_visible_windows()]

    if args.focus is not None:
        if args.left_display:
            width, _ = xdotool.get_display_geometry()
            windows = [w for w in windows if w.x < width]

        if args.right_display:
            width, _ = xdotool.get_display_geometry()
            windows = [w for w in windows if w.x >= width]

        if args.focus < len(windows):
            windows.sort(key=lambda w: (w.x, w.y, w.name))
            windows[args.focus].activate()

    spatial_activate = {
        'left': activate_left,
        'right': activate_right,
        'above': activate_above,
        'below': activate_below
    }

    if args.move in spatial_activate:
        _, win = get_active_window(windows)
        spatial_activate[args.move](win, windows)

if __name__ == '__main__':
    main()
