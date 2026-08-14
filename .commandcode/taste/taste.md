# Taste

## Communication
- User communicates in Indonesian (Bahasa Indonesia); responds in Indonesian to match. Confidence: 0.9

## Work approach
- Prefers comprehensive, deep overhauls over incremental fixes — explicitly requested a full redesign plus feature development and authorized breaking changes ("walaupun breaking change") to make everything more scalable and better. Confidence: 0.9
- Prefers upgrading dependency/tool versions to match what the user already has installed in their environment (e.g., upgrade Flutter to the version currently installed via FVM) rather than picking arbitrary latest versions. Confidence: 0.7
- When tooling/installation commands fail repeatedly in the agent's environment (e.g., `npm install` network/cache issues), the user will run the command themselves on their own machine and report back the result (e.g., "saya sudah berhasil npm i"), expecting the agent to continue the work instead of endlessly retrying. Confidence: 0.6
