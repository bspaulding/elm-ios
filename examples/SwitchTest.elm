module Main exposing (Model, Msg(..), init, main, update, view)

import Element
    exposing
        ( Element
        , button
        , column
        , label
        , program
        , switch
        )
import Element.Attributes
    exposing
        ( alignItems
        , isOn
        , flexGrow
        , justifyContent
        , text
        )
import Element.Events exposing (onTouchUpInside, onBoolValueChanged)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    Bool


init : ( Model, Cmd Msg )
init =
    ( True, Cmd.none )



-- UPDATE


type Msg
    = SwitchToggled
    | SwitchValueChanged Bool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SwitchValueChanged bool -> ( bool, Cmd.none )
        SwitchToggled ->
            ( if model then
                False

              else
                True
            , Cmd.none
            )



-- VIEW


view : Model -> Element Msg
view model =
    column
        [ flexGrow 1
        , justifyContent "center"
        , alignItems "center"
        ]
        [ label
            [ text <|
                if model then
                    "On"

                else
                    "Off"
            ]
        , switch [ isOn model, onBoolValueChanged SwitchValueChanged ]
        , button [ text "Toggle It!", onTouchUpInside SwitchToggled ]
        ]
