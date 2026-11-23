import LiveScripts.Shared
import LiveScripts.S_0fb3482637d024566f70fc43ed09a6178a545fa281e55e72082c44fe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0fb3482637d024566f70fc43ed09a6178a545fa281e55e72082c44fe.script [ctx] 10000]
