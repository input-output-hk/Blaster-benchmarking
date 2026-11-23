import LiveScripts.Shared
import LiveScripts.S_07bfaef56473e52fefeb2003bcfbd5c92101770394cad97b3bce1bc8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07bfaef56473e52fefeb2003bcfbd5c92101770394cad97b3bce1bc8.script [ctx] 10000]
