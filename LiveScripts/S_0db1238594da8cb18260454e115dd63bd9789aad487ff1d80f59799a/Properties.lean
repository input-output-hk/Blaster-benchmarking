import LiveScripts.Shared
import LiveScripts.S_0db1238594da8cb18260454e115dd63bd9789aad487ff1d80f59799a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0db1238594da8cb18260454e115dd63bd9789aad487ff1d80f59799a.script [ctx] 10000]
