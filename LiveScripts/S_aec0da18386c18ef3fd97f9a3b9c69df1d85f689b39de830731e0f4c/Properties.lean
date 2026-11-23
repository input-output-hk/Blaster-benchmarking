import LiveScripts.Shared
import LiveScripts.S_aec0da18386c18ef3fd97f9a3b9c69df1d85f689b39de830731e0f4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aec0da18386c18ef3fd97f9a3b9c69df1d85f689b39de830731e0f4c.script [ctx] 10000]
