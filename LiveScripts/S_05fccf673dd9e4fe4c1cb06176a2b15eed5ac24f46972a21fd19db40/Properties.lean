import LiveScripts.Shared
import LiveScripts.S_05fccf673dd9e4fe4c1cb06176a2b15eed5ac24f46972a21fd19db40.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_05fccf673dd9e4fe4c1cb06176a2b15eed5ac24f46972a21fd19db40.script [ctx] 10000]
