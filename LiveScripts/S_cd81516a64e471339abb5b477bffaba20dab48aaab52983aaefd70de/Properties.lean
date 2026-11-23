import LiveScripts.Shared
import LiveScripts.S_cd81516a64e471339abb5b477bffaba20dab48aaab52983aaefd70de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cd81516a64e471339abb5b477bffaba20dab48aaab52983aaefd70de.script [ctx] 10000]
