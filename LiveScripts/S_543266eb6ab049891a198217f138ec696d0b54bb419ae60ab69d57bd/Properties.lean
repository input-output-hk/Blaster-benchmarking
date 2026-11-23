import LiveScripts.Shared
import LiveScripts.S_543266eb6ab049891a198217f138ec696d0b54bb419ae60ab69d57bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_543266eb6ab049891a198217f138ec696d0b54bb419ae60ab69d57bd.script [ctx] 10000]
