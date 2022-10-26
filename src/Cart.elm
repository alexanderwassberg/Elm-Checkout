module Cart exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Products exposing (..)



-- Main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Init


init : Product
init =
    productTwo



-- Update


type Msg
    = Inc
    | Dec


update : Msg -> Product -> Product
update msg model =
    case msg of
        Inc ->
            { model | quantity = model.quantity + 1 }

        Dec ->
            { model | quantity = model.quantity - 1 }



-- View


view : Product -> Html Msg
view model =
    div [ class "cart" ] [ viewRow model ]


viewRow : Product -> Html Msg
viewRow product =
    div [ class "cart_row", class (checkQuantity product) ]
        [ span [ class "cart_row__title" ] [ text product.title ]
        , div [ class "cart_row__right" ]
            [ span [ class "cart_row__price" ] [ text (totalPrice product) ]
            , div [ class "cart_row__amount" ]
                [ button [ onClick Dec ] [ text "-" ]
                , span [] [ text (String.fromInt product.quantity) ]
                , button [ onClick Inc ] [ text "+" ]
                ]
            ]
        ]



-- Helpers


totalPrice : Product -> String
totalPrice product =
    let
        quantity =
            product.quantity

        price =
            product.price

        total =
            toFloat quantity * price
    in
    String.fromFloat total ++ ":-"


checkQuantity : Product -> String
checkQuantity product =
    if product.quantity < 1 then
        "disabled"

    else
        ""
