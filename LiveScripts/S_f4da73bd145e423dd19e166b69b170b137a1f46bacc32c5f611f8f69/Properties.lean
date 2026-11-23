import LiveScripts.Shared
import LiveScripts.S_f4da73bd145e423dd19e166b69b170b137a1f46bacc32c5f611f8f69.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f4da73bd145e423dd19e166b69b170b137a1f46bacc32c5f611f8f69.script [ctx] 10000]
