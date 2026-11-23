import LiveScripts.Shared
import LiveScripts.S_38af3730fecea148e9dfa30d3fcfff573d1ea8c8e31efe73471112a1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_38af3730fecea148e9dfa30d3fcfff573d1ea8c8e31efe73471112a1.script [datum, redeemer, ctx] 10000]
