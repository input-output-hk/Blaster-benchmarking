import LiveScripts.Shared
import LiveScripts.S_0579d854929fc734091facc8ac4f6fe93c0d43929f2bd49781c36d39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0579d854929fc734091facc8ac4f6fe93c0d43929f2bd49781c36d39.script [ctx] 10000]
