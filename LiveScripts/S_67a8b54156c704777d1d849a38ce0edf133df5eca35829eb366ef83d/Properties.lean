import LiveScripts.Shared
import LiveScripts.S_67a8b54156c704777d1d849a38ce0edf133df5eca35829eb366ef83d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_67a8b54156c704777d1d849a38ce0edf133df5eca35829eb366ef83d.script [ctx] 10000]
