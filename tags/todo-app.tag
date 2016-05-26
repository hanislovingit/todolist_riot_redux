
<todo-app>
    <h1>ToDo List with Riot and Redux</h1>
    <label for="toDoInput">Add a To Do: 
        <input type="text" name="toDoInput" placeholder="enter something..." />
    </label>
    <button type="button" onclick="{addTodo}">Add #{this.items.length + 1}</button>

    <ul>
        <li each={item, i in items}>{item}</li>
    </ul>

    <style scoped>
        :scope {
            width: 100%;
            min-height: 400px;
            /*background-color: lightblue;*/
        }
        
        input {
            width: 300px;
            
        }
    </style>

    <script>
        this.items = [];
        
        this.addTodo = () => {
            this.items.push(this.toDoInput.value);
            this.toDoInput.value = "";
        }
        
        
    </script>
</todo-app>