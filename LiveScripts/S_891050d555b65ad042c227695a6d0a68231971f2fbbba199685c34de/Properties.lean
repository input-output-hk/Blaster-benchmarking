import LiveScripts.Shared
import LiveScripts.S_891050d555b65ad042c227695a6d0a68231971f2fbbba199685c34de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_891050d555b65ad042c227695a6d0a68231971f2fbbba199685c34de.script [ctx] 10000]
