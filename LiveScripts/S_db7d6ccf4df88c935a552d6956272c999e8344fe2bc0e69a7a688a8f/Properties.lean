import LiveScripts.Shared
import LiveScripts.S_db7d6ccf4df88c935a552d6956272c999e8344fe2bc0e69a7a688a8f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_db7d6ccf4df88c935a552d6956272c999e8344fe2bc0e69a7a688a8f.script [ctx] 10000]
