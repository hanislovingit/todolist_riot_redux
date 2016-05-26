const actions = {
    addTodo: (todo) => ({
        type: "ADD_TODO",
        payload: todo
    }),
    toggleTodo: (todo) => ({
        type: "TOGGLE_TODO",
        payload: todo
    }),
    setFilter: (filter) => ({
        type: "SET_FILTER",
        payload: filter
    })        
};

export default actions;