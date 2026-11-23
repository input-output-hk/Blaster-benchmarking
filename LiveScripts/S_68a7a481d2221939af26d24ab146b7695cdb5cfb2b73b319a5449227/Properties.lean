import LiveScripts.Shared
import LiveScripts.S_68a7a481d2221939af26d24ab146b7695cdb5cfb2b73b319a5449227.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_68a7a481d2221939af26d24ab146b7695cdb5cfb2b73b319a5449227.script [datum, redeemer, ctx] 10000]
