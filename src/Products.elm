module Products exposing (..)


type alias Product =
    { id : Int
    , title : String
    , price : Float
    , quantity : Int
    }


productOne : Product
productOne =
    { id = 412
    , title = "Notebook"
    , price = 139
    , quantity = 1
    }


productTwo : Product
productTwo =
    { id = 734
    , title = "Pencil"
    , price = 29
    , quantity = 1
    }
