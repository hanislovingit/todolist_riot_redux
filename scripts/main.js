import riot from "riot";
import {createStore} from "redux";
import {combineReducers} from "redux";
import riotReduxMixin from "riot-redux-mixin";

import "./tags/todo-app.tag!";
import actions from "./actions.js";

const todoApp = (state = [{
    id: 0,
    text: "seed item",
    completed: true
}], action) => {
    switch (action.type) {
        case "ADD_TODO":
            return [
                ...state,
                {
                    id: state.length,
                    text: action.payload.text,
                    completed: false
                }];
        case "TOGGLE_TODO":
            return state.map(todo => {
               if (todo.id === action.payload.id) {
                   return {
                       ...todo,
                       completed: !action.payload.completed
                   };
               } else {
                   return todo;
               }
            });
        default:
            return state;
    }
};

// const todoApp = combineReducers({
//     todo
// });

const store = createStore(todoApp);

riot.mixin('redux', riotReduxMixin(store));
riot.mixin('actions', actions);
riot.mount("*");