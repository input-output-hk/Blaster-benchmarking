import LiveScripts.Shared
import LiveScripts.S_afd0199edce0910b2d4ba9cf97e373d342b8de8ca2a2b764538a4dae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_afd0199edce0910b2d4ba9cf97e373d342b8de8ca2a2b764538a4dae.script [redeemer, ctx] 10000]
