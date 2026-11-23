import LiveScripts.Shared
import LiveScripts.S_2e42dd8c70ff300776373832dc45e8647f2d03dc46ed65488eafaaa5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2e42dd8c70ff300776373832dc45e8647f2d03dc46ed65488eafaaa5.script [ctx] 10000]
