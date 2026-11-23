import LiveScripts.Shared
import LiveScripts.S_dfbb4ab9f7932053ae137a1b3747970ddef3aa3a1ca0c3ae90a85ae2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dfbb4ab9f7932053ae137a1b3747970ddef3aa3a1ca0c3ae90a85ae2.script [ctx] 10000]
