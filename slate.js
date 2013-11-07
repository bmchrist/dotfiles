S.src('.reslate/reslate.js');

slate.alias('hyper', 'ctrl;alt;cmd');

// begin config
slate.configAll({
    defaultToCurrentScreen: true,
    nudgePercentOf: 'screenSize',
    resizePercentOf: 'screenSize',
    undoOps: [
        'active-snapshot',
        'chain',
        'grid',
        'layout',
        'move',
        'resize',
        'sequence',
        'shell',
        'push'
    ]
});

// bindings
slate.bindAll({
    hyper: {
        shift: {
            // edges
            h: [$('barResize', 'left',   3),
                $('center',    'left',   3, 3)],
            j: [$('barResize', 'bottom', 2),
                $('center',    'bottom', 3, 3)],
            k: [$('barResize', 'top',    2),
                $('center',    'top',    3, 3)],
            l: [$('barResize', 'right',  3),
                $('center',    'right',  3, 3)],
        },
        // bars
        h: [$('barResize', 'left',  2),
            $('barResize', 'left',  1.5)],
        j: $('barResize', 'bottom', 2),
        k: $('barResize', 'top',    2),
        l: [$('barResize', 'right', 2),
            $('barResize', 'right', 1.5)],
        // corners
        y: [$('corner', 'top-left'),
            $('corner', 'top-left', 1.5)],
        i: [$('corner', 'top-right'),
            $('corner', 'top-right', 1.5)],
        b: [$('corner', 'bottom-left'),
            $('corner', 'bottom-left', 1.5)],
        m: [$('corner', 'bottom-right'),
            $('corner', 'bottom-right', 1.5)],
        // centers
        u: $('center', 'top'),
        n: $('center', 'bottom'),
       
        // maximize
        'space': $('divResize', 1,1), 

        // direct focus 
        c: $.focus('Google Chrome'),
        s: $.focus('Sublime Text'),
        t: $.focus('iTerm'),
        f: $.focus('Finder'),
        m: $.focus('Spotify'),
        p: $.focus('Preview'),

        // utility functions
        f1: 'relaunch',
        z: 'undo',
        tab: 'hint'
    }
});
