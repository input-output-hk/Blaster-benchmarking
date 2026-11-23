import LiveScripts.Shared
import LiveScripts.S_78a1ec37d8072b8ff92ca591ca362be083df4001f10f81a5e73f5dad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78a1ec37d8072b8ff92ca591ca362be083df4001f10f81a5e73f5dad.script [redeemer, ctx] 10000]
