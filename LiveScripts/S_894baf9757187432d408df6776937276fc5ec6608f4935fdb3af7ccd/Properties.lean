import LiveScripts.Shared
import LiveScripts.S_894baf9757187432d408df6776937276fc5ec6608f4935fdb3af7ccd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_894baf9757187432d408df6776937276fc5ec6608f4935fdb3af7ccd.script [ctx] 10000]
