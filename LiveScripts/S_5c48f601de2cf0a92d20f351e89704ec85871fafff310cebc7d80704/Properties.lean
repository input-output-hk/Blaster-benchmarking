import LiveScripts.Shared
import LiveScripts.S_5c48f601de2cf0a92d20f351e89704ec85871fafff310cebc7d80704.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5c48f601de2cf0a92d20f351e89704ec85871fafff310cebc7d80704.script [ctx] 10000]
