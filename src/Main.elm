module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events as Events
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
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                ]

        2 ->
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                ]

        3 ->
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                ]

        4 ->
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                ]

        5 ->
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                ]

        6 ->
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot" ] []
                    , div [ Attr.class "dot" ] []
                    ]
                ]

        _ ->
            div [ Attr.class "dice" ]
                [ div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                , div [ Attr.class "row" ]
                    [ div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    , div [ Attr.class "dot-hide" ] []
                    ]
                ]


view : Model -> Browser.Document Msg
view model =
    { title = "Avetta Dice"
    , body =
        [ div [ Attr.class "app" ]
            [ div [ Attr.class "page-title" ]
                [ h1 [] [ text "Hello Avetta" ]
                ]
            , div [ Attr.class "spacer-md" ] []
            , drawDice model
            , div [ Attr.class "spacer-sm" ] []
            , button
                [ Attr.class "roll-btn"
                , Events.onClick Roll
                ]
                [ text "Roll" ]
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
