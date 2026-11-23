import LiveScripts.Shared
import LiveScripts.S_757761eefd99307cac9b6590648fa14d60fdff9d3bc48db093af5cf6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_757761eefd99307cac9b6590648fa14d60fdff9d3bc48db093af5cf6.script [ctx] 10000]
