import LiveScripts.Shared
import LiveScripts.S_7fe72f00d4e55b6b05715991971e4c5b8eb4a59ea498b8c8f80521c8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7fe72f00d4e55b6b05715991971e4c5b8eb4a59ea498b8c8f80521c8.script [ctx] 10000]
