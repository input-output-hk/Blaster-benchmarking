import LiveScripts.Shared
import LiveScripts.S_8b200843eb2618cbdfdf2acbe4a49b6d608107006ec63106f08ba12b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b200843eb2618cbdfdf2acbe4a49b6d608107006ec63106f08ba12b.script [ctx] 10000]
