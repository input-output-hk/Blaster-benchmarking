import LiveScripts.Shared
import LiveScripts.S_e82e01b111b99f4d9eafc8adf8e777c6eea1ff7d09519d6c4193710f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e82e01b111b99f4d9eafc8adf8e777c6eea1ff7d09519d6c4193710f.script [ctx] 10000]
