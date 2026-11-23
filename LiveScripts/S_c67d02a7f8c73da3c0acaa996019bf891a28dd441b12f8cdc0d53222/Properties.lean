import LiveScripts.Shared
import LiveScripts.S_c67d02a7f8c73da3c0acaa996019bf891a28dd441b12f8cdc0d53222.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c67d02a7f8c73da3c0acaa996019bf891a28dd441b12f8cdc0d53222.script [datum, redeemer, ctx] 10000]
