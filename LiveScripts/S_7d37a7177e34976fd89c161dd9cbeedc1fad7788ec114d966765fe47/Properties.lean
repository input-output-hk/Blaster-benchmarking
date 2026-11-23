import LiveScripts.Shared
import LiveScripts.S_7d37a7177e34976fd89c161dd9cbeedc1fad7788ec114d966765fe47.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d37a7177e34976fd89c161dd9cbeedc1fad7788ec114d966765fe47.script [ctx] 10000]
