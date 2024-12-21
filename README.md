# 🚀 Brigade: Task Execution Agent System

Welcome to **Brigade**! This Erlang OTP application is designed to manage and execute tasks through agents. These agents interact with the **Guanco Ollama** client, executing tasks based on dynamic requests. **Brigade** is ideal for orchestrating a distributed system of agents working together to process tasks efficiently.

## 📦 Installation

To get started with **Brigade**, follow these steps:

### Prerequisites

Ensure you have the following installed:

- [Erlang/OTP](https://www.erlang.org/downloads) (Version 24 or above)
- Git (for cloning the repository)
- [Rebar3](https://www.rebar3.org/) (for compiling and managing dependencies)

### Clone the Repository

Clone the **Brigade** repository to your local machine:

```sh
git clone https://github.com/yourusername/brigade.git
cd brigade
```

### Compile and Run the Application

Use **Rebar3** to compile and run the **Brigade** application in one step:

```sh
rebar3 shell
```

This command will:

1. Compile the application.
2. Start the Erlang shell with the **Brigade** application running.

The supervisor will automatically start the main components, including the commander and agent workers.

## 🛠 Usage

Once **Brigade** is running, you can interact with the agents to execute tasks.

### Executing a Task

To execute a task, use the following command:

```erlang
brigade_agent:execute_task(AgentId, Task).
```

Where `AgentId` is the unique identifier of the agent, and `Task` is the task you want to execute.

### Example: Execute a Task

```erlang
1> brigade_agent:execute_task(a1, "Process Data").
Agent #a1 executing task Process Data
{ok, "Agent #a1 executing task Process Data"}
```

In this example, we have an agent execute the `"Process Data"` task.

## 🌱 Contributing

We welcome contributions to improve **Brigade**! Here’s how you can contribute:

1. Fork the repository on GitHub.
2. Create a new branch for your changes.
3. Commit your changes with a meaningful message.
4. Push the changes to your fork.
5. Open a pull request with a detailed description of your changes.

## 📋 License

This project is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for more details.


✨ **Enjoy using Brigade** to manage and execute your tasks in Erlang! Feel free to reach out if you run into any issues or have suggestions for improvement. We’re here to help! 💬

