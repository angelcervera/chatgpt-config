# Custom GPT source definitions

This directory is reserved for source-controlled definitions of custom GPTs created for this account/project.

Custom GPT configuration is not the same artifact format as an Agent Plugin, so GPT source definitions should not be mixed into `plugins/` or packaged by the plugin build scripts.

Use one directory per GPT and keep its instructions, metadata, prompts, and other source material there. Add a GPT-specific build/export process only when there is a supported target format to generate.
