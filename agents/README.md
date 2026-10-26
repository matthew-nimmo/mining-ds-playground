# Agents

This is a collection of simple CLI programs for experimenting with agentic AI harness engineering and testing local small language models. Only the LLMs that can run on a Mac Mini M4 with 24GB of unified memory are tested. The CLI programs are written in Go.

## agent1
Basic agentic AI harness to test small language models on a simple calculation exercise.

## agentx
A slightly more complicated agentic AI harness. The AI agent uses a markdown canvas to work on. Agent cues are provided via HTML comments. A cue can target a specific agent to complete the task. An agent can hand-off tasks to other agents by inserting additional cues into the markdown canvas.