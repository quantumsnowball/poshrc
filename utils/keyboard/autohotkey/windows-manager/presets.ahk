; consts
X_LEFT    := 0
X_CENTER  := 50
X_RIGHT   := 100
Y_TOP     := 0
Y_CENTER  := 50
Y_BOTTOM  := 100
W_TINY    := 25.0
W_SMALL   := 33.33
W_MEDIUM  := 50.0
W_LARGE   := 66.67
W_GIANT   := 75.0
H_MEDIUM  := 50
H_NORMAL  := 85
H_FULL    := 100


; presets
PRESETS := [
    [ ; 1. left tiny
        [X_LEFT  , Y_TOP   , W_TINY   , H_MEDIUM , ""  ],
        [X_LEFT  , Y_TOP   , W_TINY   , H_NORMAL , ""  ],
        [X_LEFT  , Y_CENTER, W_TINY   , H_FULL   , ""  ],
        [X_LEFT  , Y_BOTTOM, W_TINY   , H_NORMAL , ""  ],
        [X_LEFT  , Y_BOTTOM, W_TINY   , H_MEDIUM , ""  ], ], 
    [ ; 2. left
        [X_LEFT  , Y_TOP   , W_SMALL  , H_MEDIUM , "q" ],
        [X_LEFT  , Y_TOP   , W_SMALL  , H_NORMAL , ""  ],
        [X_LEFT  , Y_CENTER, W_SMALL  , H_FULL   , "a" ],
        [X_LEFT  , Y_BOTTOM, W_SMALL  , H_NORMAL , ""  ],
        [X_LEFT  , Y_BOTTOM, W_SMALL  , H_MEDIUM , "z" ], ], 
    [ ; 3. left wide
        [X_LEFT  , Y_TOP   , W_MEDIUM , H_MEDIUM , ""  ],
        [X_LEFT  , Y_TOP   , W_MEDIUM , H_NORMAL , ""  ],
        [X_LEFT  , Y_CENTER, W_MEDIUM , H_FULL   , "r" ],
        [X_LEFT  , Y_BOTTOM, W_MEDIUM , H_NORMAL , ""  ],
        [X_LEFT  , Y_BOTTOM, W_MEDIUM , H_MEDIUM , ""  ], ], 
    [ ; 4. central max left
        [X_LEFT  , Y_TOP   , W_LARGE  , H_MEDIUM , ""  ],
        [X_LEFT  , Y_TOP   , W_LARGE  , H_NORMAL , ""  ],
        [X_LEFT  , Y_CENTER, W_LARGE  , H_FULL   , "t" ],
        [X_LEFT  , Y_BOTTOM, W_LARGE  , H_NORMAL , ""  ],
        [X_LEFT  , Y_BOTTOM, W_LARGE  , H_MEDIUM , ""  ], ], 
    [ ; 5. central wide
        [X_CENTER, Y_TOP   , W_MEDIUM , H_MEDIUM , ""  ],
        [X_CENTER, Y_TOP   , W_MEDIUM , H_NORMAL , ""  ],
        [X_CENTER, Y_CENTER, W_MEDIUM , H_FULL   , "w" ],
        [X_CENTER, Y_BOTTOM, W_MEDIUM , H_NORMAL , "x" ],
        [X_CENTER, Y_BOTTOM, W_MEDIUM , H_MEDIUM , ""  ], ], 
    [ ; 6. central wide max right
        [X_RIGHT , Y_TOP   , W_GIANT  , H_MEDIUM , ""  ],
        [X_RIGHT , Y_TOP   , W_GIANT  , H_NORMAL , ""  ],
        [X_RIGHT , Y_CENTER, W_GIANT  , H_FULL   , "g" ],
        [X_RIGHT , Y_BOTTOM, W_GIANT  , H_NORMAL , ""  ],
        [X_RIGHT , Y_BOTTOM, W_GIANT  , H_MEDIUM , ""  ], ], 
    [ ; 7. central
        [X_CENTER, Y_TOP   , W_SMALL  , H_MEDIUM , ""  ],
        [X_CENTER, Y_TOP   , W_SMALL  , H_NORMAL , ""  ],
        [X_CENTER, Y_CENTER, W_SMALL  , H_FULL   , "s" ],
        [X_CENTER, Y_BOTTOM, W_SMALL  , H_NORMAL , ""  ],
        [X_CENTER, Y_BOTTOM, W_SMALL  , H_MEDIUM , ""  ], ], 
    [ ; 8. central max right
        [X_RIGHT , Y_TOP   , W_LARGE  , H_MEDIUM , ""  ],
        [X_RIGHT , Y_TOP   , W_LARGE  , H_NORMAL , ""  ],
        [X_RIGHT , Y_CENTER, W_LARGE  , H_FULL   , "fb"],
        [X_RIGHT , Y_BOTTOM, W_LARGE  , H_NORMAL , ""  ],
        [X_RIGHT , Y_BOTTOM, W_LARGE  , H_MEDIUM , ""  ], ], 
    [ ; 9. right wide
        [X_RIGHT , Y_TOP   , W_MEDIUM , H_MEDIUM , ""  ],
        [X_RIGHT , Y_TOP   , W_MEDIUM , H_NORMAL , ""  ],
        [X_RIGHT , Y_CENTER, W_MEDIUM , H_FULL   , "v" ],
        [X_RIGHT , Y_BOTTOM, W_MEDIUM , H_NORMAL , ""  ],
        [X_RIGHT , Y_BOTTOM, W_MEDIUM , H_MEDIUM , ""  ], ], 
    [ ; 10. right
        [X_RIGHT , Y_TOP   , W_SMALL  , H_MEDIUM , "e" ],
        [X_RIGHT , Y_TOP   , W_SMALL  , H_NORMAL , ""  ],
        [X_RIGHT , Y_CENTER, W_SMALL  , H_FULL   , "d" ],
        [X_RIGHT , Y_BOTTOM, W_SMALL  , H_NORMAL , ""  ],
        [X_RIGHT , Y_BOTTOM, W_SMALL  , H_MEDIUM , "c" ], ],
    [ ; 11. right tiny
        [X_RIGHT , Y_TOP   , W_TINY   , H_MEDIUM , ""  ],
        [X_RIGHT , Y_TOP   , W_TINY   , H_NORMAL , ""  ],
        [X_RIGHT , Y_CENTER, W_TINY   , H_FULL   , ""  ],
        [X_RIGHT , Y_BOTTOM, W_TINY   , H_NORMAL , ""  ],
        [X_RIGHT , Y_BOTTOM, W_TINY   , H_MEDIUM , ""  ], ],
]

PRESETS_FOCUS := [
    [8, 3],
    [5, 3],
    [7, 3],
]
