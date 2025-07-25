# Groq Agentic Tooling for FlutterFlow

This repository provides a comprehensive guide and a set of custom actions to integrate Groq's powerful and fast AI models, including their new **Agentic Tooling** capabilities, into your FlutterFlow applications. Now you can leverage models that can perform web searches and execute code to provide real-time, accurate, and complex responses.

This project is designed for FlutterFlow developers who want to build advanced AI-powered features with minimal setup.

## Key Features

* **Agentic Tooling Integration**: Utilize Groq's new models that can intelligently use tools like web search and a Python code interpreter.
* **Real-time Data Access**: Overcome the knowledge cut-off limitations of standard LLMs by enabling your app to access up-to-date information from the web.
* **Built-in Code Execution**: Perform calculations, run algorithms, and process data using the integrated Python code interpreter.
* **Zero-Configuration Tooling**: All tool calls (web search, code execution) are handled on Groq's servers, meaning no complex client-side setup is required.
* **Flexible Custom Actions**: Includes multiple custom actions to suit different use cases, from simple prompts to complex conversational history with tool usage insights.
* **FlutterFlow-Ready**: Built specifically for easy integration with FlutterFlow's custom action and data type system.

## Agentic Tooling Models

Groq provides specialized models for agentic tasks. Choosing the right one depends on your specific needs for speed and complexity.

| **Model Name** | **Tool Calls per Request** | **Best For** | **Latency** |
| -------------------- | -------------------------- | --------------------------------------------------------------------------------------------------------- | ----------- |
| `compound-beta`      | Multiple                   | Complex tasks requiring several web searches or code executions in a single turn (e.g., in-depth research). | Higher      |
| `compound-beta-mini` | Single                     | Simpler tasks needing one tool use, like a quick calculation or a single web search.                      | \~3x Lower  |

### Model Recommendations

* **Research & Current Events**: `compound-beta` for multi-step research or `compound-beta-mini` for single-point data retrieval.
* **Calculations & Data Processing**: `compound-beta-mini` is ideal for its lower latency on single computations.
* **General Chat & Standard Prompts**: For conversations that don't require external tools, you can still use standard high-performance models like `llama3-70b-8192` or `gemma-7b-it`.

## Included Custom Actions

This project comes with three core custom actions found in the `/lib/custom_code/actions/` directory.

### 1. `sendGroqMessage`

The simplest way to get a response from a Groq model. It's ideal for one-off prompts that don't require conversational context or agentic tools.

* **Inputs**:
    * `apiKey` (String): Your Groq API key.
    * `model` (String): The model you want to use (e.g., `llama3-70b-8192`).
    * `prompt` (String): The user's message or question.
* **Output**:
    * `Future<String>`: The content of the AI's response.

### 2. `sendGroqMessageAdvanced`

This is the most powerful action, designed for building conversational chatbots, especially with **agentic models**. It sends the full chat history for context and returns a structured response that includes both the message content and information about any tools the model used.

* **Inputs**:
    * `apiKey` (String): Your Groq API key.
    * `model` (String): An agentic model (`compound-beta` or `compound-beta-mini`).
    * `prompt` (String): The user's request.
    * `chatHistory` (List<JSON>): The existing conversation history.
* **Output**:
    * `Future<GroqResponseStruct>`: A custom data type containing:
        * `content` (String): The final response message.
        * `toolInfo` (List<String>): A list of messages describing the tools used (e.g., "Searching the web for 'latest Flutter news'").

### 3. `validateGroqSetup`

A helpful utility action to verify that your Groq API key is correct and working. You can call this on a button tap or when the app loads to ensure your AI features will function properly.

* **Inputs**:
    * `apiKey` (String): The Groq API key you want to validate.
* **Output**:
    * `Future<bool>`: Returns `true` if the key is valid, `false` otherwise.

## Custom Data Types

To support the `sendGroqMessageAdvanced` action, a custom data type is included.

### `GroqResponseStruct`

You must create this Data Type in FlutterFlow to handle the structured output from the advanced custom action.

* **Fields**:
    * `content` (String)
    * `toolInfo` (List<String>)

## Setup in FlutterFlow

1.  **Add Dependencies**:
    * Go to **Settings > Custom Code > Pubspec Dependencies**.
    * Add the `http` package: `http: ^1.2.1` (or the latest version).
2.  **Create Custom Data Type**:
    * Go to **Data Types** (left menu) and click **Create Data Type**.
    * Name it `GroqResponseStruct`.
    * Add the fields `content` (String) and `toolInfo` (List<String>).
3.  **Add Custom Actions**:
    * Go to **Custom Code** (left menu) and select the **Actions** tab.
    * Create a new Custom Action for each of the `.dart` files in the `lib/custom_code/actions/` directory (`send_groq_message.dart`, `send_groq_message_advanced.dart`, and `validate_groq_setup.dart`).
    * Copy the code from each file into a new action in FlutterFlow.
    * Define the arguments and return values for each action as specified in the code comments and this README. For `sendGroqMessageAdvanced`, ensure the return type is set to your `GroqResponseStruct` Data Type.
4.  **Implement in your UI**:
    * Store your Groq API key securely. You can set it as an App State variable for easy access.
    * Use a `TextField` for user input and a `Button` to trigger the custom action.
    * To build a chat interface, use a `ListView` or `Column` bound to an App State variable (e.g., `chatMessages`, a list of JSONs) to display the conversation.
    * When calling an action, pass the required parameters (API key, model, prompt, and chat history if applicable).
    * Update your App State with the response to refresh the UI. When using the `sendGroqMessageAdvanced` action, you can display the `toolInfo` list to show the user the agent's steps.

## Example Usage: Agentic Search

Here’s how you could build a simple "ask me anything with search" feature:

1.  **UI**:
    * A `TextField` named `promptInput`.
    * A `Button` to trigger the action.
    * A `Text` widget to display the main response.
    * Another `ListView` or `Column` to display the tool usage steps.
2.  **App State**:
    * `groqApiKey` (String, Persisted)
    * `lastResponse` (GroqResponseStruct)
    * `chatHistory` (List<JSON>)
3.  **Button Action Flow**:
    * **On Tap > Add Action > Custom Action**.
    * Select `sendGroqMessageAdvanced`.
    * Set the parameters:
        * `apiKey`: from App State `groqApiKey`.
        * `model`: set to a string, e.g., `compound-beta-mini`.
        * `prompt`: from Widget State `promptInput`.
        * `chatHistory`: from App State `chatHistory`.
    * Give the action an output variable name, e.g., `groqAgentResponse`.
    * **Add another action** to update the App State:
        * Set `lastResponse` to the output `groqAgentResponse`.
        * Update the `chatHistory` by adding the user's prompt and then the AI's response.
    * Your UI widgets bound to `lastResponse.content` and `lastResponse.toolInfo` will now update automatically.
