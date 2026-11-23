import LiveScripts.Shared
import LiveScripts.S_729cb992ad203283b56e81e254383368232984c3edb685e5c2296af3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_729cb992ad203283b56e81e254383368232984c3edb685e5c2296af3.script [ctx] 10000]
