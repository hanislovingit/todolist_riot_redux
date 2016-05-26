
<todo-app>
    <h1>ToDo List with Riot and Redux</h1>
    <label for="todoInput">Add a To Do: 
        <input type="text" name="todoInput" placeholder="enter something..." />
    </label>
    <button type="button" onclick="{add}">Add #{this.items.length + 1}</button>

    <ul>
        <li each={item, i in items} style="text-decoration: {item.completed ? 'line-through' : 'none'}" >
            <input type="checkbox" checked={item.completed} onclick="{toggle}" key={item.id} />
            {item.text}            
        </li>
    </ul>

    <style scoped>
        :scope {
            width: 100%;
            min-height: 400px;
        }
        
        input[type=text] {
            width: 300px;
            font-style: none;
        }
        
    </style>

    <script>
        this.mixin('redux');
        this.mixin('actions');
        
        this.items = this.store.getState();
        
        this.add = () => {
            const newTodo = {
                text: this.todoInput.value,
            };
            this.todoInput.value = "";
            const action = this.addTodo(newTodo);
            this.store.dispatch(action);
        }
        
        this.toggle = (e) => {
            const toggledTodo = {
                id: parseInt(e.target.attributes["key"].value),
                completed: !e.target.checked
            }
            
            const action = this.toggleTodo(toggledTodo);
            this.store.dispatch(action);
        }
        
        this.store.subscribe(() => {
            this.items = this.store.getState();
            this.update();
        });
        
        
        
    </script>
</todo-app>