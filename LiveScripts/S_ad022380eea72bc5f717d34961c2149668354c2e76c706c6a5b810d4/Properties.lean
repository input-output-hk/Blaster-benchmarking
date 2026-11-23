import LiveScripts.Shared
import LiveScripts.S_ad022380eea72bc5f717d34961c2149668354c2e76c706c6a5b810d4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad022380eea72bc5f717d34961c2149668354c2e76c706c6a5b810d4.script [ctx] 10000]
