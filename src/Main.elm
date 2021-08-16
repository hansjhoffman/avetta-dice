module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Random



-- MODEL


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 1, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


type Msg
    = Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( newFace, Cmd.none )



-- VIEW


drawDice : Model -> Html msg
drawDice model =
    case model of
        1 ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                ]

        2 ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    ]
                ]

        3 ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    ]
                ]

        4 ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    ]
                ]

        5 ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot" ] []
                    ]
                ]

        6 ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot" ] []
                    , div [ class "dot" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot" ] []
                    , div [ class "dot" ] []
                    , div [ class "dot" ] []
                    ]
                ]

        _ ->
            div [ class "dice" ]
                [ div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                , div [ class "row" ]
                    [ div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    , div [ class "dot-hide" ] []
                    ]
                ]


view : Model -> Browser.Document Msg
view model =
    { title = "Avetta Dice"
    , body =
        [ div [ class "app" ]
            [ div [ class "page-title" ]
                [ h1 [] [ text "Hello Avetta" ]
                ]
            , div [ class "spacer-md" ] []
            , drawDice model
            , div [ class "spacer-sm" ] []
            , button [ class "roll-btn", onClick Roll ] [ text "Roll" ]
            ]
        ]
    }



-- MAIN


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
