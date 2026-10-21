# Free Claude

One-click launcher that runs the Claude Code CLI on Windows through a local
[FreeLLMAPI](https://github.com/tashfeenahmed/freellmapi) gateway, so requests go to
free-tier models (Gemini, Groq, OpenRouter, LLM7) instead of paid Anthropic models.

> The banner in Claude Code still says "Opus", but answers come from the free models
> FreeLLMAPI routes to. Quality is lower than real Claude; check MOSES files before running them.

## Setup (Windows)

1. Install Node.js LTS, then Claude Code: `irm https://claude.ai/install.ps1 | iex`
2. Install the FreeLLMAPI desktop app from its GitHub Releases page.
   The desktop build listens on `http://127.0.0.1:31415`.
3. In the dashboard (Keys page) add free provider keys: Google AI Studio, Groq, OpenRouter.
   Set Models → Routing strategy → **Smartest**.
4. Run `Make-Shortcut.ps1`. A **Free Claude** icon appears on the desktop.
5. Double-click it. The first time, paste the unified key from Keys → Unified API key.
   It is saved in the user env var `FREELLMAPI_KEY`.

## Notes

- `ANTHROPIC_BASE_URL` / `ANTHROPIC_AUTH_TOKEN` are set only for that window,
  so normal Claude Code logins are unaffected.
- Never commit keys. No key is stored in this repo.
- If requests fail with 429, a free daily limit was hit; add more providers.
