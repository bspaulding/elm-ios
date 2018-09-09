module Main exposing (Model, Msg(..), init, main, update, view)

import Element
    exposing
        ( Element
        , button
        , column
        , label
        , program
        , slider
        )
import Element.Attributes
    exposing
        ( alignItems
        , flexGrow
        , justifyContent
        , text
        , value
        , minimumValue
        , maximumValue
        , isContinuous
        )
import Element.Events exposing (onFloatValueChanged)


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
    Int


init : ( Model, Cmd Msg )
init =
    ( 2, Cmd.none )



-- UPDATE


type Msg
    = ValueChanged Float


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ValueChanged f ->
            ( round f, Cmd.none)



-- VIEW


view : Model -> Element Msg
view model =
    column
        [ flexGrow 1
        , justifyContent "center"
        , alignItems "center"
        ]
        [ label
            [ text <| toString model ]
        , slider [ minimumValue -5, maximumValue 5, value (toFloat model), isContinuous True, onFloatValueChanged ValueChanged ]
        ]
