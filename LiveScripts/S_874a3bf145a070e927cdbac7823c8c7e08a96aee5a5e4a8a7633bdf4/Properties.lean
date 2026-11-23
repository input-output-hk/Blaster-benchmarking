import LiveScripts.Shared
import LiveScripts.S_874a3bf145a070e927cdbac7823c8c7e08a96aee5a5e4a8a7633bdf4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_874a3bf145a070e927cdbac7823c8c7e08a96aee5a5e4a8a7633bdf4.script [ctx] 10000]
