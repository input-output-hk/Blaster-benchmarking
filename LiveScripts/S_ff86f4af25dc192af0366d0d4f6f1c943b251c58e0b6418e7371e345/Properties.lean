import LiveScripts.Shared
import LiveScripts.S_ff86f4af25dc192af0366d0d4f6f1c943b251c58e0b6418e7371e345.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ff86f4af25dc192af0366d0d4f6f1c943b251c58e0b6418e7371e345.script [ctx] 10000]
