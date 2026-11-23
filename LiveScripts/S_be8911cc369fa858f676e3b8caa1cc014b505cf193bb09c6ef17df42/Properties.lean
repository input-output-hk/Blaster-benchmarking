import LiveScripts.Shared
import LiveScripts.S_be8911cc369fa858f676e3b8caa1cc014b505cf193bb09c6ef17df42.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_be8911cc369fa858f676e3b8caa1cc014b505cf193bb09c6ef17df42.script [ctx] 10000]
