import LiveScripts.Shared
import LiveScripts.S_673f2bfaa44efb5e9ae881606e32f94dfbee5ccd1c8ca4f9c44365de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_673f2bfaa44efb5e9ae881606e32f94dfbee5ccd1c8ca4f9c44365de.script [ctx] 10000]
