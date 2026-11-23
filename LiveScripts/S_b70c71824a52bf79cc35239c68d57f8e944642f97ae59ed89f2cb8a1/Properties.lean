import LiveScripts.Shared
import LiveScripts.S_b70c71824a52bf79cc35239c68d57f8e944642f97ae59ed89f2cb8a1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b70c71824a52bf79cc35239c68d57f8e944642f97ae59ed89f2cb8a1.script [datum, redeemer, ctx] 10000]
