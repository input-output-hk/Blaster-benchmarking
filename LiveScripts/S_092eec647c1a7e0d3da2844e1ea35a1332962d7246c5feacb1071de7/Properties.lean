import LiveScripts.Shared
import LiveScripts.S_092eec647c1a7e0d3da2844e1ea35a1332962d7246c5feacb1071de7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_092eec647c1a7e0d3da2844e1ea35a1332962d7246c5feacb1071de7.script [ctx] 10000]
