import LiveScripts.Shared
import LiveScripts.S_62ce5ed7dc8fd1d5b77a4af5156b914efbbddeb0820bd74ab9ac4d7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62ce5ed7dc8fd1d5b77a4af5156b914efbbddeb0820bd74ab9ac4d7a.script [ctx] 10000]
