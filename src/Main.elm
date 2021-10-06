module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events as Events
import Random


type FaceValue
    = One
    | Two
    | Three
    | Four
    | Five
    | Six


oneToSix : Random.Generator FaceValue
oneToSix =
    Random.uniform One [ Two, Three, Four, Five, Six ]


roll : Cmd Msg
roll =
    Random.generate NewFace oneToSix



-- MODEL


type alias Model =
    FaceValue


init : () -> ( Model, Cmd Msg )
init _ =
    ( One, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


type Msg
    = Roll
    | NewFace FaceValue


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, roll )

        NewFace newFace ->
            ( newFace, Cmd.none )



-- VIEW


drawDice : Model -> Html msg
drawDice model =
    case model of
        One ->
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

        Two ->
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

        Three ->
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

        Four ->
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

        Five ->
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

        Six ->
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
